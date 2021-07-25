$(function() {
    $('.wrapper-feeds-album').hide()

    $('.button-photo').on('click', function() {
        $('.button-album').removeClass('active')
        $(this).addClass('active')
        $('.wrapper-feeds-album').hide()
        $('.wrapper-feeds-photo').show()


    })

    $('.button-album').on('click', function() {
        $('.button-photo').removeClass('active')
        $(this).addClass('active')
        $('.wrapper-feeds-photo').hide()
        $('.wrapper-feeds-album').show()
    })




    $('.wrapper-feeds-album .album-images').each(function() {
        let $this = $(this)
        $this.children("img").each(function(index) {
            if (index > 3) return
            // console.log(`rotate(${index*20}deg)`)
            $(this).css('transform' ,`rotate(${index*3}deg)`)
            // console.log(this)
        })

    })
})