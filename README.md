# Bridge-Labz Class

## Live Classes

### Class 01-03(basic linux command)

- ls -R
- ls -la
- rmdir "hello world"
- rm *file-name
- start/open *file-name (windows/mac)
- cp source.file destination.file
- mv source.file destination.path
- head file.name
- head -5 file.name
- tail -5 file.name
- ctrl c = quit
- ctrl z = pause
- jobs = list all suspended process
- fg %{job number} = resume a specific job in foreground
- bg %{job number} = resume a specific job in background
- ps -elf
- kill -9
- ps -elf | grep "java" | grep -v "grep" | awk '{print $4}'
- kill -9 $(ps -elf | grep "java" | grep -v "grep" | awk '{print $4}')
- du
- ps
- kill

### Class 04-10(Shell Scripting)

- variable declaration
- Arithmetic expression $(expr $ * $), $(())
- Arithmetic Operation
- Operators
- Condition statement(If/Switch)
- Loop(For/While)
- Function
- Array
- Dictionary(Associative array)
- Git and Github

<hr>

## Projects

    ./projects/backup_ubuntu.sh

Installation of Basic required apps of Ubuntu/Debian based linux distribution`(on progress)`

    ./projects/rename.sh

rename all files from a specific folder `(on progress)`

    ./projects/guess-a-no.sh

Extra Light weight number guessing game from assignment
