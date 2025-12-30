# Clean old build artifacts
echo "Cleaning old PDF files..."
rm -f *.pdf *.aux *.log *.out
rm -rf resume_pdf/

docker build -t sb2nov/latex .

# Build English version with pdflatex
docker run --rm -i -v "$PWD":/data sb2nov/latex pdflatex fushun_resume.tex

# Build Chinese version with xelatex
docker run --rm -i -v "$PWD":/data sb2nov/latex xelatex fushun_resume_zh.tex

mkdir -p resume_pdf
cp fushun_resume.pdf resume_pdf/
cp fushun_resume_zh.pdf resume_pdf/

echo "Build completed successfully!"
