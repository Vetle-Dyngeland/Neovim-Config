return {
    {
        "folke/todo-comments.nvim",
        config = function() 
            local todo = require("todo-comments")

            todo.setup({
                search = {
                    command = "rg"
                }
            })
        end
    }
}
