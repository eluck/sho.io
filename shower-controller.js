window.addEventListener('message', function(event) {
    if (event.data  == 'engine') return window.parent.postMessage('shower', '*');
    if (event.data.match(/^eval:::/)) return window.parent.postMessage(eval(event.data.split(':::')[1]), '*');
});