function textLimit(elementId){
    document.getElementById(elementId).addEventListener('input', function(event) {
            var inputField = document.getElementById(elementId);
            var inputValue = inputField.value;
            if (inputValue.length > 255) {
                inputField.value=null
                displayErrorMessageNavbar(elementId,"Error: The keyword exceeds the maximum limit of 255 characters.");

            }else{
                document.getElementById(elementId).addEventListener('input', function(event) {
                    var ErrorMessage = document.getElementById(elementId+'ErrorMessage');
                    ErrorMessage.style.display = 'none';
                });
            }
        // });
    });

}
function displayErrorMessageNavbar(elementId,message) {
    var ErrorMessage = document.getElementById(elementId+`ErrorMessage`);
        ErrorMessage.textContent = message;
        ErrorMessage.style.display = 'block';
}

function imageValidation(buttonId,elementId){
    document.getElementById(buttonId).addEventListener('click', function(event) {
        var fileInput = document.getElementById(elementId);
        var maxFileSize = 128 * 1024;

        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];

            if (file.size > maxFileSize) {
                displayErrorMessageProfileUpdate("Error: The file size exceeds the maximum allowed size of 128KB.");
                event.preventDefault();
                return;
            }else{
                document.getElementById(elementId).addEventListener('change', function(event) {
                    var updateErrorMessage = document.getElementById(elementId+'ErrorMessage');
                    updateErrorMessage.style.display = 'none';
                });
            }

            var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            if (!allowedTypes.includes(file.type)) {
                displayErrorMessageProfileUpdate("Error: Please choose an image file (JPEG, PNG, GIF).");
                event.preventDefault();
            }else{
                document.getElementById(elementId).addEventListener('change', function(event) {
                    var updateErrorMessage = document.getElementById(elementId+'ErrorMessage');
                    updateErrorMessage.style.display = 'none';
                });
            }
        }
    });
}
function displayErrorMessageProfileUpdate(message) {
    var updateErrorMessage = document.getElementById(elementId+'ErrorMessage');
    updateErrorMessage.textContent = message;
    updateErrorMessage.style.display = 'block';
}




