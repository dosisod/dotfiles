-- Set convenient mappings for when I SSH into my computer fron my phone.
if os.getenv("SSH_CLIENT") then
	-- Map "." to ":"
	vim.api.nvim_set_keymap('n', '.', ':', {})

	-- Re-enable arrow keys
	vim.api.nvim_del_keymap('', '<up>')
	vim.api.nvim_del_keymap('', '<down>')
	vim.api.nvim_del_keymap('', '<left>')
	vim.api.nvim_del_keymap('', '<right>')
	vim.api.nvim_del_keymap('i', '<up>')
	vim.api.nvim_del_keymap('i', '<down>')
	vim.api.nvim_del_keymap('i', '<left>')
	vim.api.nvim_del_keymap('i', '<right>')
	vim.api.nvim_del_keymap('c', '<up>')
	vim.api.nvim_del_keymap('c', '<down>')
	vim.api.nvim_del_keymap('c', '<left>')
	vim.api.nvim_del_keymap('c', '<right>')
	vim.api.nvim_del_keymap('t', '<up>')
	vim.api.nvim_del_keymap('t', '<down>')
	vim.api.nvim_del_keymap('t', '<left>')
	vim.api.nvim_del_keymap('t', '<right>')
end
