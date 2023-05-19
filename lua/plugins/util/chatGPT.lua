return {
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local chatgpt = require("chatgpt")

            chatgpt.setup({
                api_key_cmd = "c:/users/parco/AppData/Local/nvim/chatGPT_api_key.exe"
            })
        end
    }
}
