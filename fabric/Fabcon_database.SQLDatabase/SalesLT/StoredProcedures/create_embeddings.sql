
CREATE   PROCEDURE SalesLT.create_embeddings
(
    @input_text NVARCHAR(MAX),
    @embedding VECTOR(1536) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @url NVARCHAR(MAX) =
        'https://azureopenaifab26.openai.azure.com/openai/deployments/text-embedding-ada-002/embeddings?api-version=2024-06-01';

    DECLARE @payload NVARCHAR(MAX) =
    (
        SELECT @input_text AS [input]
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
    );

    DECLARE @response NVARCHAR(MAX);
    DECLARE @retval INT;

    BEGIN TRY
        EXEC @retval = sp_invoke_external_rest_endpoint
            @url = @url,
            @method = 'POST',
            @credential = [https://azureopenaifab26.openai.azure.com],
            @payload = @payload,
            @response = @response OUTPUT;
    END TRY
    BEGIN CATCH
        SELECT
            'SQL' AS error_source,
            ERROR_NUMBER() AS error_code,
            ERROR_MESSAGE() AS error_message;
        RETURN;
    END CATCH;

    IF (@retval <> 0)
    BEGIN
        SELECT
            'OPENAI' AS error_source,
            JSON_VALUE(@response, '$.result.error.code') AS error_code,
            JSON_VALUE(@response, '$.result.error.message') AS error_message,
            @response AS error_response,
            @payload AS payload_sent,
            @input_text AS input_text_sent;
        RETURN;
    END;

    DECLARE @json_embedding NVARCHAR(MAX) =
        JSON_QUERY(@response, '$.result.data[0].embedding');

    SET @embedding = CAST(@json_embedding AS VECTOR(1536));
END;

GO

