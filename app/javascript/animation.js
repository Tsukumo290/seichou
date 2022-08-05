window.addEventListener('load', function(){
  const getAnimation = document.getElementById('animation');
  if (!getAnimation) return null;
  lottie.loadAnimation({
    container: getAnimation,
    renderer: 'svg',
    loop: false,
    autoplay: true,
    path: '/animations/41351-baby-mom-love.json'
  });
})