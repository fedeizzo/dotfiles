let g:axe#cmds = {
            \    'markdown':{
            \        'build':{
            \            'cmd':'makePDF',
            \            'in_term':0,
            \            'with_filename':1,
            \        }
            \    },
            \    'cpp':{
            \         'compile':{
            \            'cmd':'g++',
            \            'in_term':0,
            \            'with_filename':1,
            \        },
            \         'run':{
            \            'cmd':'./a.out',
            \            'in_term':1,
            \            'with_filename':0,
            \        }
            \    },
            \    'nim':{
            \         'compile':{
            \            'cmd':'nim c',
            \            'in_term':1,
            \            'with_filename':1,
            \        }
            \    }
            \}
