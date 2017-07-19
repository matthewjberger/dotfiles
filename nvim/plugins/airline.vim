" Airline

let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\uE0C0"
let g:airline_right_sep = "\uE0C2"
" Set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

