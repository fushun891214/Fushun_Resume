docker build -t sb2nov/latex .
docker run --rm -i -v "$PWD":/data sb2nov/latex pdflatex fushun_resume.tex
mkdir -p resume_pdf
cp fushun_resume.pdf resume_pdf/
