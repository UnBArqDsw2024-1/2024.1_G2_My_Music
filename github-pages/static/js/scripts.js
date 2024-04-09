

const content_dir = '../docs/Base/'

const config_file = 'config.yml'
const section_names = ['designSprint',  'glossario', 'artefato5w2h', 'brainstorming', 'questionario','entrevista', 'lexico', 'mapaMental', 'richpicture',  'equipe']


window.addEventListener('DOMContentLoaded', event => {

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });


    // Yaml
    fetch(content_dir + config_file)
        .then(response => response.text())
        .then(text => {
            const yml = jsyaml.load(text);
            Object.keys(yml).forEach(key => {
                try {
                    document.getElementById(key).innerHTML = yml[key];
                } catch {
                    console.log("Unknown id and value: " + key + "," + yml[key].toString())
                }

            })
        })
        .catch(error => console.log(error));


    // Marked
    const renderer = new marked.Renderer();
        
    const originalTableRenderer = renderer.table;
        
    // Override the table renderer
    renderer.table = (header, body) => {
        return originalTableRenderer.call(renderer, header, body).replace('<table>', '<table class="table table-striped">');
    };
    
    const originalImageRenderer = renderer.image;
    
    // Override the image renderer
    renderer.image = (href, title, text) => {
        return originalImageRenderer.call(renderer, href, title, text).replace('<img', '<img class="img-fluid"');
    };
    
    // Use the new renderer
    marked.use({ renderer });


    marked.use({ mangle: false, headerIds: false })
    section_names.forEach((name, idx) => {
        fetch(content_dir + name + '.md')
            .then(response => response.text())
            .then(markdown => {
                const html = marked.parse(markdown);
                document.getElementById(name + '-md').innerHTML = html;
            }).then(() => {
                // MathJax
                MathJax.typeset();
            })
            .catch(error => console.log(error));
    })

}); 
