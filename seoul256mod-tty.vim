" Description: seoul256mod in userland (GUI environment) and tty

if !exists('s:rgb_map')
    let s:rgb_map =
    \{ 16: '#000000',  17: '#00005f',  18: '#000087',
    \  19: '#0000af',  20: '#0000d7',  21: '#0000ff',
    \  22: '#005f00',  23: '#005f5f',  24: '#005f87',
    \  25: '#005faf',  26: '#005fd7',  27: '#005fff',
    \  28: '#008700',  29: '#00875f',  30: '#008787',
    \  31: '#0087af',  32: '#0087d7',  33: '#0087ff',
    \  34: '#00af00',  35: '#00af5f',  36: '#00af87',
    \  37: '#00afaf',  38: '#00afd7',  39: '#00afff',
    \  40: '#00d700',  41: '#00d75f',  42: '#00d787',
    \  43: '#00d7af',  44: '#00d7d7',  45: '#00d7ff',
    \  46: '#00ff00',  47: '#00ff5f',  48: '#00ff87',
    \  49: '#00ffaf',  50: '#00ffd7',  51: '#00ffff',
    \  52: '#5f0000',  53: '#5f005f',  54: '#5f0087',
    \  55: '#5f00af',  56: '#5f00d7',  57: '#5f00ff',
    \  58: '#5f5f00',  59: '#5f5f5f',  60: '#5f5f87',
    \  61: '#5f5faf',  62: '#5f5fd7',  63: '#5f5fff',
    \  64: '#5f8700',  65: '#5f875f',  66: '#5f8787',
    \  67: '#5f87af',  68: '#5f87d7',  69: '#5f87ff',
    \  70: '#5faf00',  71: '#5faf5f',  72: '#5faf87',
    \  73: '#5fafaf',  74: '#5fafd7',  75: '#5fafff',
    \  76: '#5fd700',  77: '#5fd75f',  78: '#5fd787',
    \  79: '#5fd7af',  80: '#5fd7d7',  81: '#5fd7ff',
    \  82: '#5fff00',  83: '#5fff5f',  84: '#5fff87',
    \  85: '#5fffaf',  86: '#5fffd7',  87: '#5fffff',
    \  88: '#870000',  89: '#87005f',  90: '#870087',
    \  91: '#8700af',  92: '#8700d7',  93: '#8700ff',
    \  94: '#875f00',  95: '#875f5f',  96: '#875f87',
    \  97: '#875faf',  98: '#875fd7',  99: '#875fff',
    \ 100: '#878700', 101: '#87875f', 102: '#878787',
    \ 103: '#8787af', 104: '#8787d7', 105: '#8787ff',
    \ 106: '#87af00', 107: '#87af5f', 108: '#87af87',
    \ 109: '#87afaf', 110: '#87afd7', 111: '#87afff',
    \ 112: '#87d700', 113: '#87d75f', 114: '#87d787',
    \ 115: '#87d7af', 116: '#87d7d7', 117: '#87d7ff',
    \ 118: '#87ff00', 119: '#87ff5f', 120: '#87ff87',
    \ 121: '#87ffaf', 122: '#87ffd7', 123: '#87ffff',
    \ 124: '#af0000', 125: '#af005f', 126: '#af0087',
    \ 127: '#af00af', 128: '#af00d7', 129: '#af00ff',
    \ 130: '#af5f00', 131: '#af5f5f', 132: '#af5f87',
    \ 133: '#af5faf', 134: '#af5fd7', 135: '#af5fff',
    \ 136: '#af8700', 137: '#af875f', 138: '#af8787',
    \ 139: '#af87af', 140: '#af87d7', 141: '#af87ff',
    \ 142: '#afaf00', 143: '#afaf5f', 144: '#afaf87',
    \ 145: '#afafaf', 146: '#afafd7', 147: '#afafff',
    \ 148: '#afd700', 149: '#afd75f', 150: '#afd787',
    \ 151: '#afd7af', 152: '#afd7d7', 153: '#afd7ff',
    \ 154: '#afff00', 155: '#afff5f', 156: '#afff87',
    \ 157: '#afffaf', 158: '#afffd7', 159: '#afffff',
    \ 160: '#d70000', 161: '#d7005f', 162: '#d70087',
    \ 163: '#d700af', 164: '#d700d7', 165: '#d700ff',
    \ 166: '#d75f00', 167: '#d75f5f', 168: '#d75f87',
    \ 169: '#d75faf', 170: '#d75fd7', 171: '#d75fff',
    \ 172: '#d78700', 173: '#d7875f', 174: '#d78787',
    \ 175: '#d787af', 176: '#d787d7', 177: '#d787ff',
    \ 178: '#d7af00', 179: '#d7af5f', 180: '#d7af87',
    \ 181: '#d7afaf', 182: '#d7afd7', 183: '#d7afff',
    \ 184: '#d7d700', 185: '#d7d75f', 186: '#d7d787',
    \ 187: '#d7d7af', 188: '#d7d7d7', 189: '#d7d7ff',
    \ 190: '#d7ff00', 191: '#d7ff5f', 192: '#d7ff87',
    \ 193: '#d7ffaf', 194: '#d7ffd7', 195: '#d7ffff',
    \ 196: '#ff0000', 197: '#ff005f', 198: '#ff0087',
    \ 199: '#ff00af', 200: '#ff00d7', 201: '#ff00ff',
    \ 202: '#ff5f00', 203: '#ff5f5f', 204: '#ff5f87',
    \ 205: '#ff5faf', 206: '#ff5fd7', 207: '#ff5fff',
    \ 208: '#ff8700', 209: '#ff875f', 210: '#ff8787',
    \ 211: '#ff87af', 212: '#ff87d7', 213: '#ff87ff',
    \ 214: '#ffaf00', 215: '#ffaf5f', 216: '#ffaf87',
    \ 217: '#ffafaf', 218: '#ffafd7', 219: '#ffafff',
    \ 220: '#ffd700', 221: '#ffd75f', 222: '#ffd787',
    \ 223: '#ffd7af', 224: '#ffd7d7', 225: '#ffd7ff',
    \ 226: '#ffff00', 227: '#ffff5f', 228: '#ffff87',
    \ 229: '#ffffaf', 230: '#ffffd7', 231: '#ffffff',
    \ 232: '#080808', 233: '#121212', 234: '#1c1c1c',
    \ 235: '#262626', 236: '#303030', 237: '#3a3a3a',
    \ 238: '#444444', 239: '#4e4e4e', 240: '#585858',
    \ 241: '#626262', 242: '#6c6c6c', 243: '#767676',
    \ 244: '#808080', 245: '#8a8a8a', 246: '#949494',
    \ 247: '#9e9e9e', 248: '#a8a8a8', 249: '#b2b2b2',
    \ 250: '#bcbcbc', 251: '#c6c6c6', 252: '#d0d0d0',
    \ 253: '#dadada', 254: '#e4e4e4', 255: '#eeeeee' }
endif

let bg = 233
let fg = 252

if !has('gui_running') | set t_Co=256 | endif
hi clear
if exists("syntax_on") | syntax reset | endif

function! s:hi(item, fg, bg)
  let fg = a:fg[0] > 255 ? 231 : a:fg[0]
  let bg = a:bg[0] > 255 ? 231 : a:bg[0]

  if !empty(fg)
    execute printf("highlight %s ctermfg=%s guifg=%s", a:item, fg, get(s:rgb_map, fg, 'NONE'))
  endif
  if !empty(bg)
    execute printf("highlight %s ctermbg=%s guibg=%s", a:item, bg, get(s:rgb_map, bg, 'NONE'))
  endif
endfunction

if exists('$DISPLAY')
  call s:hi('Normal', [fg], [bg])

  call s:hi('LineNr',    [101], [bg])
  call s:hi('Visual',    [''],  [239])
  call s:hi('VisualNOS', [''],  [239])

  call s:hi('Comment',         [65],  [''])
  call s:hi('Number',          [222], [''])
  call s:hi('Float',           [222], [''])
  call s:hi('Boolean',         [103], [''])
  call s:hi('String',          [109], [''])
  call s:hi('Constant',        [73],  [''])
  call s:hi('Character',       [174], [''])
  call s:hi('Delimiter',       [137], [''])
  call s:hi('StringDelimiter', [137], [''])
  call s:hi('Statement',       [108], [''])
  " case, default, etc.
  " hi Label ctermfg=

  " if else end
  call s:hi('Conditional', [110], [''])

  " while end
  call s:hi('Repeat',   [68],  [''])
  call s:hi('Todo',     [161], [bg])
  call s:hi('Function', [187], [''])

  " Macros
  call s:hi('Define',    [173], [''])
  call s:hi('Macro',     [173], [''])
  call s:hi('Include',   [173], [''])
  call s:hi('PreCondit', [173], [''])


  " #!
  call s:hi('PreProc', [143], [''])

  " @abc
  call s:hi('Identifier', [217], [''])

  " AAA Abc
  call s:hi('Type', [179], [''])

  " + - * / <<
  call s:hi('Operator', [186], [''])

  " super yield
  call s:hi('Keyword', [168], [''])

  " raise
  call s:hi('Exception', [161], [''])
  "
  " hi StorageClass ctermfg=
  call s:hi('Structure', [116], [''])
  " hi Typedef ctermfg=

  call s:hi('Error',      [fg], [52])
  call s:hi('ErrorMsg',   [fg], [52])
  call s:hi('Underlined', [181],       [''])

  " set textwidth=80
  " set colorcolumn=+1
  call s:hi('ColorColumn', [''], [bg + 5])

  " GVIM only
  " hi Cursor ctermfg=
  " hi CursorIM ctermfg=

  " set cursorline cursorcolumn
  call s:hi('CursorLine',   [''],  [bg - 1])
  call s:hi('CursorLineNr', [108], [bg - 1])
  call s:hi('CursorColumn', [''],  [bg - 1])
  call s:hi('NormalFloat',  [''],  [bg - 1])

  call s:hi('Directory', [187], [''])

  call s:hi('DiffAdd',    ['NONE'], [22])
  call s:hi('DiffDelete', ['NONE'], [95])
  call s:hi('DiffChange', ['NONE'], [bg + 3])
  call s:hi('DiffText',   ['NONE'], [52])

  call s:hi('VertSplit', [232], [232])
  call s:hi('Folded', [101], [bg + 1])

  " set foldcolumn=1
  call s:hi('FoldColumn', [144], [bg + 1])

  call s:hi('MatchParen', [''], [bg + 7])

  " -- INSERT --
  call s:hi('ModeMsg', [151], [''])

  " let &showbreak = '> '
  call s:hi('NonText', [59], [''])

  call s:hi('MoreMsg', [173], [''])

  " Popup menu
  call s:hi('Pmenu',      [187], [236])
  call s:hi('PmenuSel',   [233], [250])
  call s:hi('PmenuSbar',  [''],  [65])
  call s:hi('PmenuThumb', [''],  [23])

  call s:hi('Search',    [fg], [24])
  call s:hi('IncSearch', [230],       [bg + 1])

  " String delimiter, interpolation
  call s:hi('Special', [216], [''])
  " hi SpecialChar ctermfg=
  " hi SpecialComment ctermfg=
  " hi Tag ctermfg=
  " hi Debug ctermfg=

  " :map, listchars
  call s:hi('SpecialKey', [59], [''])

  if !has('gui_running')
    " Red / Blue / Cyan / Magenta
    hi SpellBad   ctermbg=NONE cterm=underline ctermfg=168
    hi SpellCap   ctermbg=NONE cterm=underline ctermfg=110
    hi SpellLocal ctermbg=NONE cterm=underline ctermfg=153
    hi SpellRare  ctermbg=NONE cterm=underline ctermfg=218
  else
    execute 'hi SpellBad   gui=undercurl guisp=' . s:rgb_map[168]
    execute 'hi SpellCap   gui=undercurl guisp=' . s:rgb_map[110]
    execute 'hi SpellLocal gui=undercurl guisp=' . s:rgb_map[153]
    execute 'hi SpellRare  gui=undercurl guisp=' . s:rgb_map[218]
  endif

  "
  call s:hi('StatusLine',       [bg],     [187])
  call s:hi('StatusLineNC',     [bg + 2], [187])
  call s:hi('StatusLineTerm',   [233],           [151])
  call s:hi('StatusLineTermNC', [bg + 2], [187])
  hi StatusLineTerm cterm=bold,reverse gui=bold,reverse
  hi StatusLineTermNC cterm=bold,reverse gui=bold,reverse

  call s:hi('TabLineFill', [bg],      [''])
  call s:hi('TabLineSel',  [187],            [233])
  call s:hi('TabLine',     [bg + 12], [bg + 4])
  call s:hi('WildMenu',    [bg],      [187])

  " :set all
  call s:hi('Title', [181], [''])

  " TODO
  call s:hi('Question', [179], [''])

  " Search hit bottom
  call s:hi('WarningMsg', [179], [''])

  " Sign column
  call s:hi('SignColumn', [173], [bg])

  " Diff
  call s:hi('diffAdded',   [108], [''])
  call s:hi('diffRemoved', [174], [''])
  hi link diffLine Constant

  call s:hi('Conceal', [fg + 2], [bg - 1])
  call s:hi('Ignore',  [bg + 3], [bg])

  " Remove ~ when creating new file
  call s:hi('EndOfBuffer',  [bg], [''])

  " statusline mode color
  call s:hi('NormalModeColor',  [233], [187])
  call s:hi('InsertModeColor',  [233], [151])
  call s:hi('VisualModeColor',  [233], [152])
  call s:hi('CommandModeColor', [233], [217])

  """""""""""""""""""""""""""""""""""""""""""""""""
  " Plugins
  """""""""""""""""""""""""""""""""""""""""""""""""

  " vim-sneak
  " -----------
  call s:hi('Sneak',      [bg], [230])
  call s:hi('SneakLabel', [bg], [230])

  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  " ---------------------------------------------------^^^^^
  call s:hi('ExtraWhitespace', [''], [bg - 1])

  hi CursorLine cterm=NONE
  hi CursorLineNr cterm=NONE

else
  call s:hi('Normal', [fg], [bg])

  call s:hi('LineNr',    [101], [bg])
  call s:hi('Visual',    [''],  [77])
  call s:hi('VisualNOS', [''],  [77])

  call s:hi('Comment',         [231],  [''])
  call s:hi('Number',          [101], [''])
  call s:hi('Float',           [101], [''])
  call s:hi('Boolean',         [103], [''])
  call s:hi('String',          [44], [''])
  call s:hi('Constant',        [44],  [''])
  call s:hi('Character',       [fg], [''])
  call s:hi('Delimiter',       [fg], [''])
  call s:hi('StringDelimiter', [fg], [''])
  call s:hi('Statement',       [fg], [''])
  " case, default, etc.
  " hi Label ctermfg=

  " if else end
  call s:hi('Conditional', [fg], [''])

  " while end
  call s:hi('Repeat',   [fg],  [''])
  call s:hi('Todo',     [161], [''])
  call s:hi('Function', [fg], [''])

  " Macros
  call s:hi('Define',    [fg], [''])
  call s:hi('Macro',     [fg], [''])
  call s:hi('Include',   [fg], [''])
  call s:hi('PreCondit', [fg], [''])


  " #!
  call s:hi('PreProc', [fg], [''])

  " @abc
  call s:hi('Identifier', [fg], [''])

  " AAA Abc
  call s:hi('Type', [fg], [''])

  " + - * / <<
  call s:hi('Operator', [fg], [''])

  " super yield
  call s:hi('Keyword', [fg], [''])

  " raise
  call s:hi('Exception', [fg], [''])
  "
  " hi StorageClass ctermfg=
  call s:hi('Structure', [fg], [''])
  " hi Typedef ctermfg=

  call s:hi('Error',      [fg], [161])
  call s:hi('ErrorMsg',   [fg], [161])
  call s:hi('Underlined', [fg],       [''])

  " set textwidth=80
  " set colorcolumn=+1
  call s:hi('ColorColumn', [''], [fg])

  " GVIM only
  " hi Cursor ctermfg=
  " hi CursorIM ctermfg=

  " set cursorline cursorcolumn
  call s:hi('CursorLine',   [''],  [bg])
  call s:hi('CursorLineNr', [77], [bg])
  call s:hi('CursorColumn', [''],  [bg])
  call s:hi('NormalFloat',  [''],  [bg])

  call s:hi('Directory', [fg], [''])

  call s:hi('DiffAdd',    ['NONE'], [77])
  call s:hi('DiffDelete', ['NONE'], [161])
  call s:hi('DiffChange', [bg], [fg])
  call s:hi('DiffText',   ['NONE'], ['NONE'])

  call s:hi('VertSplit', [bg], [bg])
  call s:hi('Folded', [101], [bg])

  " set foldcolumn=1
  call s:hi('FoldColumn', [101], [bg])

  call s:hi('MatchParen', [''], [255])

  " -- INSERT --
  call s:hi('ModeMsg', [77], [''])

  " let &showbreak = '> '
  call s:hi('NonText', [fg], [''])

  call s:hi('MoreMsg', [77], [''])

  " Popup menu
  call s:hi('Pmenu',      [bg], [fg])
  call s:hi('PmenuSel',   [fg], [bg])
  call s:hi('PmenuSbar',  [''],  [77])
  call s:hi('PmenuThumb', [''],  [bg])

  call s:hi('Search',    [bg], [fg])
  call s:hi('IncSearch', [bg],       [fg])

  " String delimiter, interpolation
  call s:hi('Special', [101], [''])
  " hi SpecialChar ctermfg=
  " hi SpecialComment ctermfg=
  " hi Tag ctermfg=
  " hi Debug ctermfg=

  " :map, listchars
  call s:hi('SpecialKey', [fg], [''])

  if !has('gui_running')
    " Red / Blue / Cyan / Magenta
    hi SpellBad   ctermbg=NONE cterm=underline ctermfg=161
    hi SpellCap   ctermbg=NONE cterm=underline ctermfg=109
    hi SpellLocal ctermbg=NONE cterm=underline ctermfg=152
    hi SpellRare  ctermbg=NONE cterm=underline ctermfg=252
  else
    execute 'hi SpellBad   gui=undercurl guisp=' . s:rgb_map[161]
    execute 'hi SpellCap   gui=undercurl guisp=' . s:rgb_map[109]
    execute 'hi SpellLocal gui=undercurl guisp=' . s:rgb_map[152]
    execute 'hi SpellRare  gui=undercurl guisp=' . s:rgb_map[252]
  endif

  " statusline
  call s:hi('StatusLine',       [bg],     [187])
  call s:hi('StatusLineNC',     [255], [187])
  call s:hi('StatusLineTerm',   [bg],           [151])
  call s:hi('StatusLineTermNC', [bg], [187])
  hi StatusLineTerm cterm=bold,reverse gui=bold,reverse
  hi StatusLineTermNC cterm=bold,reverse gui=bold,reverse

  call s:hi('TabLineFill', [bg],      [''])
  call s:hi('TabLineSel',  [187],            [bg])
  call s:hi('TabLine',     [bg], [255])
  call s:hi('WildMenu',    [bg],      [187])

  " :set all
  call s:hi('Title', [fg], [''])

  " TODO
  call s:hi('Question', [179], [''])

  " Search hit bottom
  call s:hi('WarningMsg', [179], [''])

  " Sign column
  call s:hi('SignColumn', [77], [bg])

  " Diff
  call s:hi('diffAdded',   [77], [''])
  call s:hi('diffRemoved', [161], [''])
  hi link diffLine Constant

  call s:hi('Conceal', [fg], [bg])
  call s:hi('Ignore',  [161], [bg])

  " Remove ~ when creating new file
  call s:hi('EndOfBuffer',  [bg], [''])

  " statusline mode color
  call s:hi('NormalModeColor',  [bg], [187])
  call s:hi('InsertModeColor',  [bg], [151])
  call s:hi('VisualModeColor',  [bg], [152])
  call s:hi('CommandModeColor', [bg], [217])

  """""""""""""""""""""""""""""""""""""""""""""""""
  " Plugins
  """""""""""""""""""""""""""""""""""""""""""""""""

  " vim-sneak
  " -----------
  call s:hi('Sneak',      [fg], [109])
  call s:hi('SneakLabel', [fg], [109])

  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  " ---------------------------------------------------^^^^^
  call s:hi('ExtraWhitespace', [''], [bg - 1])

  hi CursorLine cterm=NONE
  hi CursorLineNr cterm=NONE
endif

let g:colors_name = 'seoul256mod'
