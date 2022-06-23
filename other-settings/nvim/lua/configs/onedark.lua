local onedark = require('onedark')
if not onedark then
    return
end

onedark.setup {
    colors = {
        error = '#ff6347',
        hint = '#1BB704',
        info = '#008b8b'
    }
}
