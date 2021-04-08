" dashboard-nvim plugin config

let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_header = [
			\'',
			\ '    __               __    __            ',
			\ '   / /_  _______  __/ /_  / /___  _______',
			\ '  / __ \/ ___/ / / / __ \/ __/ / / / ___/',
			\ ' / /_/ / /  / /_/ / / / / /_/ /_/ (__  ) ',
			\ '/_.___/_/   \__,_/_/ /_/\__/\__,_/____/  ',
			\ '                                         ',
			\'',
			\]

let g:dashboard_custom_section={
			\ 'cwd_file_list': {
			\ 'description': ['  CWD Files                 SPC i'],
			\ 'command': 'Files' },
			\ 'cwd_word_list': {
			\ 'description': ['  CWD Words                 SPC o'],
			\ 'command': 'Rg' },
			\ 'home_file_list': {
			\ 'description': ['  All Files                 SPC f'],
			\ 'command': 'Files ~' },
			\ 'recent_history': {
			\ 'description': ['  Recently Opened Files          '],
			\ 'command': 'History' },
			\ 'new_file': {
			\ 'description': ['  New File                       '],
			\ 'command': 'enew' }
			\ }

" dashboard-nvim custom highlight
" -----------
" call s:hi('DashboardHeader',   [187], [''])
" call s:hi('DashboardCenter',   [151], [''])
" call s:hi('DashboardShortcut', [195], [''])
" call s:hi('DashboardFooter',   [187], [''])
