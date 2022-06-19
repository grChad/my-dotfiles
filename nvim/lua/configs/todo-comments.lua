local status_ok, todo_comments = pcall(require, 'todo-comments')
if not status_ok then
   return
end

todo_comments.setup {
   signs = true,
   sign_priority = 8,
   keywords = {
      FIX = {
         alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
      },
      WARN = { alt = { 'WARNING' } },
      PERF = { alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
   },
   highlight = {
      before = '',
      keyword = 'wide',
      after = '',
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
      exclude = {},
   },
}
