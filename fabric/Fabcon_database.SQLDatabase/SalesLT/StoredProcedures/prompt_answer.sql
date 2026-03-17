 CREATE   PROCEDURE [SalesLT].[prompt_answer]
 @user_question nvarchar(max),
 @products nvarchar(max),
 @answer nvarchar(max) output

 AS

 DECLARE @url nvarchar(4000) = 'https://azureopenaifab26.openai.azure.com/openai/deployments/gpt-4.1/chat/completions?api-version=2025-01-01-preview';
 DECLARE @payload nvarchar(max) = N'{
     "messages": [
         {
             "role": "system",
             "content": "You are a sales assistant who helps customers find the right products for their question and activities."
         },
         {
             "role": "user",
             "content": "The products available are the following: ' + @products + '"
         },
         {
             "role": "user",
             "content": " ' + @user_question + '"
         }
     ]
 }';

 DECLARE @ret int, @response nvarchar(max);

 exec @ret = sp_invoke_external_rest_endpoint
     @url = @url,
     @method = 'POST', 
     @payload = @payload,
     @credential = [https://azureopenaifab26.openai.azure.com],    
     @timeout = 230,
     @response = @response output;

 select json_value(@response, '$.result.choices[0].message.content');

GO

