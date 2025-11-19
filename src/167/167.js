const container = document.querySelector('.container')
const content = document.querySelector('.content')

if (content && content.children.length < 5) {
  const first = content.firstElementChild
  if (first) {
    for (let i = 0; i < 8; i++) {
      const clone = first.cloneNode(true)
      content.appendChild(clone)
    }
  }
}

if (container) {
  container.setAttribute('tabindex', '0')
  container.addEventListener('wheel', function (e) {
    const d = e.deltaY
    container.scrollLeft += d
    e.preventDefault()
  }, { passive: false })
  container.addEventListener('keydown', function (e) {
    if (e.key === 'ArrowRight') {
      container.scrollLeft += 80
    } else if (e.key === 'ArrowLeft') {
      container.scrollLeft -= 80
    }
  })
}