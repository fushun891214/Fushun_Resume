docker run --rm -d -p 8081:8081 -v "$PWD/resume_pdf":/data sb2nov/latex python3 -m http.server 8081
