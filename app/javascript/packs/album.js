$(function() {

    console.log('hello')



    let imageUploadInAlbum = []


    $('.new-album #photo_url').on('change', function() {
        inputFiles = this
        for(const file of inputFiles.files) {
            imageUploadInAlbum.push(file)
        }
        previewPhoto(this)

    })

    $('.new-album').on('click', '#btn-delete-photo', function() {
        // let dataFile = this.data('data-file')
        console.log(this)
        let indexRemove = imageUploadInAlbum.indexOf($(this).data('data-file'))
        // console.log(imageUploadInAlbum)
        // console.log(indexRemove)
        imageUploadInAlbum.splice(indexRemove,1)
        $(this).parent().parent().remove()
    })

    function previewPhoto(input) {
        if (input.files && input.files.length) {
            // $('.new-album .form-new-album .preview-photo-upload').removeClass('form-row')
            for(const file of input.files) {
                const reader = new FileReader();
                reader.onload = function (e) {
                        const divForImage = `
                            <div class="col-md-2 mt-3">
                                <div class="position-relative">
                                    <a class='position-absolute' style="top: 0; right: 0; color: white; z-index:100; cursor: pointer" id="btn-delete-photo" data-file='${file}'><i class="fas fa-window-close"></i></a>
                                    <img width='180' height='180' src='${e.target.result}' class='position-absolute' >
                                </div>
                            </div>
                            `
                        $('.new-album .form-new-album .preview-photo-upload').append(divForImage)
                };
    
                reader.readAsDataURL(file);
            }
            $('.new-album .form-new-album .preview-photo-upload').height($('.preview-photo-upload').height())
            input.value = null
        }
    }

    $('#submit-album').on('click', function(e) {
        e.preventDefault()
        let formData = new FormData()



        imageUploadInAlbum.forEach(file => {
            formData.append('photos_url[]', file)
        })
        let title = $('#title').val()
        let privacy = $('#privacy').val()
        let description = $('#description').val()
        // console.log(privacy)
        // console.log(description)
        formData.append('title', title)
        formData.append('privacy',privacy)
        formData.append('description', description)


        $.ajax({
            url: '/albums',
            method: 'post',
            data: formData,
            success: function(data) {
                console.log(data)
            },
            cache: false,
            processData: false,
            contentType: false,
        })
    })
    




})