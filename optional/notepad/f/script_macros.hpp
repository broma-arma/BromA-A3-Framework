#define QUOTE(var) #var

#define defDir(localdir) QUOTE(optional\notepad\localdir)

#define ifNotePadLocal(varname) if ((varname == player) OR (isserver AND (typename (varname getvariable ["CRACK_var_old_NotePad", 69]) == typename([]))))