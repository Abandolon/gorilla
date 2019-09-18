const scrollLast = () => {
  const messages = document.querySelectorAll('.messages .message');
  if (messages) {
    const message = messages[messages.length - 1];
    if (message) {
      message.scrollIntoView({behavior: 'smooth'});
    }
  }
}

export { scrollLast };
