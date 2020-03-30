import { directUploads } from './directuploads';

window.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("drag");
  if (form) {
    var fileInput = document.querySelector('input[type=file]');
    var dropzone = document.querySelector('.label');
    var pactive = document.querySelector('.inactive');
    var filenameContainer = document.querySelector('.files');
    document.querySelector('.dragndrop-form > p').classList.remove('inactive');
    document.querySelector('input[type=file]').addEventListener('change', function() {
      var files = fileInput.files;
      document.querySelector('.dragndrop-form > p').classList.add('inactive');
      // filenameContainer.innerText = fileInput.files.split('\\').pop();
      console.log(files);
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        console.log(file.name);
        filenameContainer.insertAdjacentHTML("beforeend", `<p>${file.name}</p>`);
      }
    });

    fileInput.addEventListener('dragenter', function() {
      dropzone.classList.add('dragover');
    });

    fileInput.addEventListener('dragleave', function() {
      dropzone.classList.remove('dragover');
    });
  };
  directUploads();
});
