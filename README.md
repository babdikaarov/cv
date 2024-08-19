# CV Maker using LaTeX

This repository contains a simple and efficient CV generator built using LaTeX. The primary purpose of this project is to enable users to create professional and aesthetically pleasing CVs with minimal effort.

## Features

-  **Customizable Templates**: Easily modify the LaTeX templates to suit your style and preferences.
-  **Automatic Formatting**: Ensures that your CV is neatly formatted and well-organized.
-  **PDF Output**: Generates high-quality PDF documents suitable for printing and digital sharing.

## Prerequisites

To use this CV maker, you'll need to have the following installed on your system:

-  Docker (for containerized builds)

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/babdikaarov/cv.git
cd cv
```

### Build the Docker Image

```bash
docker build -t cv-maker-latex .
```

### Generate Your CV

Place your LaTeX files in the `/data` directory. Then, run the following command:

```bash
docker run --rm -v $(pwd)/data:/data cv-maker-latex make
```

This command will generate a PDF version of your CV in the `/data` directory.

## License

This project is licensed under the MIT License. However, the latex template is owned by Sourabh Bajaj.
