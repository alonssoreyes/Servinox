$(function() {
  //Menu fijo
  var windowHeight = $(window).height();
  var barraAltura = $(".barra").innerHeight();
  $(window).scroll(function() {
    var scroll = $(window).scrollTop();
    if (scroll > windowHeight / 4) {
      $(".barra").addClass("fixed");
      $(".barra").addClass("sombra");
      $("body").css({ "margin-top": +barraAltura + "px" });
    } else {
      $(".barra").removeClass("fixed");
      $(".barra").removeClass("sombra");
      $("body").css({ "margin-top": 0 });
    }
  }); //Menu fijo

  //Submit formulario
  const formDatos = document.getElementById("formDatos");

  formDatos.addEventListener("submit", function(e) {
    e.preventDefault();
    Swal.fire({
      title: "Seguro que desea continuar?",
      text: "Verifique que todos los datos sean correctos",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Comprar!"
    }).then(result => {
      if (result.value) {
        $('body').waitMe({
            effect:'rotation',
            text:'Verificando datos espere porfavor...'
        });
        window.setInterval(() => {
            formDatos.submit();
        }, 3000);
      }
    });
  });
});
