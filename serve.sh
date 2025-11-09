echo "Starting HTTP server on http://localhost:8081"
echo "Access your resume at: http://localhost:8081/sourabh_bajaj_resume.pdf"

docker run --rm -d -p 8081:8081 -v "$PWD":/data sb2nov/latex python3 -m http.server 8081
