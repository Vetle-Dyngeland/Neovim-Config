return {
    {
        "tmillr/sos.nvim",
        config = function()
            local sos = require("sos")

            sos.setup({
                timeout = 60000,
            })
        end
    }
}
