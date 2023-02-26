local util = {}

function util.set_nvim(prop, options, callback)
    local nvim_prop = vim[prop]
    if not nvim_prop then
        vim.notify("set_nvim: prop '" .. prop .. "' not found", vim.log.levels.ERROR)
        return
    end

    if not callback then
        vim.notify("set_nvim: callback required", vim.log.levels.ERROR)
        return
    end

    for option, value in pairs(options) do
        callback(nvim_prop, option, value)
    end
end

return util
