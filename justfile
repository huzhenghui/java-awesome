_: just-choose

just-choose:
    #!/usr/bin/env sh
    choose_recipe=$(just --summary | tr ' ' '\n' | /usr/local/opt/choose-gui/bin/choose)
    echo "Choose Recipe: ${choose_recipe}"
    just "${choose_recipe}"

just-list:
    just --list

root_dir := `pwd`
draft_dir := `jump cd java-draft`
code_workspace := root_dir + '/java.code-workspace'

just-evaluate:
    just --evaluate

just-draft-dir:
    echo "{{draft_dir}}"

code:
    if [ -f '{{code_workspace}}' ]; then \
        code '{{code_workspace}}'; \
    else \
        code '{{root_dir}}'; \
    fi

jump-pins:
    jump pins | sort