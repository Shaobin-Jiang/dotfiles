function md2pdf
    if test (count $argv) -lt 2
        echo "Usage: md2pdf markdown-file pdf-file"
        return 1
    end
    pandoc $argv[1] -o $argv[2] --pdf-engine=xelatex -V CJKmainfont="PingFang SC"
end
