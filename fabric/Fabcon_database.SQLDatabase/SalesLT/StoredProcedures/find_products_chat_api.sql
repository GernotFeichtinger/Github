 CREATE   Procedure SalesLT.[find_products_chat_api]
        @text nvarchar(max)
        AS 
        exec SalesLT.find_products_chat @text
        with RESULT SETS
        (    
            (    
                answer NVARCHAR(max)
            )
        )

GO

