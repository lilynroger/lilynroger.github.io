(() => {
  const dialog = document.createElement('dialog');
  if (typeof dialog.showModal !== 'function') return;

  dialog.className = 'lr-lightbox';
  dialog.setAttribute('aria-label', '图片查看器');

  const stage = document.createElement('div');
  stage.className = 'lr-lightbox__stage';

  const figure = document.createElement('figure');
  figure.className = 'lr-lightbox__figure';

  const imageButton = document.createElement('button');
  imageButton.className = 'lr-lightbox__image-button';
  imageButton.type = 'button';
  imageButton.setAttribute('aria-label', '显示图片说明');
  imageButton.setAttribute('aria-expanded', 'false');

  const image = document.createElement('img');
  image.className = 'lr-lightbox__image';
  imageButton.append(image);

  const media = document.createElement('div');
  media.className = 'lr-lightbox__media';

  const caption = document.createElement('figcaption');
  caption.className = 'lr-lightbox__caption';
  caption.setAttribute('aria-hidden', 'true');

  const captionTitle = document.createElement('span');
  captionTitle.className = 'lr-lightbox__caption-title';
  caption.append(captionTitle);

  const attribution = document.createElement('span');
  attribution.className = 'lr-lightbox__attribution';
  caption.append(attribution);

  const closeButton = document.createElement('button');
  closeButton.className = 'lr-lightbox__close';
  closeButton.type = 'button';
  closeButton.setAttribute('aria-label', '关闭图片');
  closeButton.innerHTML = '<svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="m6 6 12 12M18 6 6 18"/></svg>';

  media.append(imageButton, caption);
  figure.append(media);
  stage.append(figure, closeButton);
  dialog.append(stage);
  document.body.append(dialog);

  let hintFigure = null;
  let returnFocusTarget = null;

  const clearHint = () => {
    hintFigure?.classList.remove('is-hint-visible');
    hintFigure = null;
  };

  const setCaptionVisible = (visible) => {
    dialog.classList.toggle('is-caption-visible', visible);
    caption.setAttribute('aria-hidden', String(!visible));
    imageButton.setAttribute('aria-expanded', String(visible));
    imageButton.setAttribute(
      'aria-label',
      visible ? '隐藏图片说明' : '显示图片说明',
    );
  };

  const openLightbox = (trigger, sourceFigure, sourceImage) => {
    const sourceCaption = sourceFigure?.querySelector('figcaption');
    const title = sourceCaption?.querySelector('.title')?.textContent.trim();
    const sourceAttribution = sourceCaption
      ?.querySelector('.attribution')
      ?.textContent.trim();

    const imageSrc = sourceImage.currentSrc || sourceImage.src;
    if (image.getAttribute('src') !== imageSrc) {
      image.src = imageSrc;
    }
    image.alt = sourceImage.alt;
    captionTitle.textContent = title || sourceImage.alt;
    attribution.textContent = sourceAttribution || '';
    attribution.hidden = !sourceAttribution;
    returnFocusTarget = trigger;
    setCaptionVisible(false);
    dialog.showModal();
    closeButton.focus();
  };

  document.addEventListener('click', (event) => {
    const target = event.target;
    const element = target instanceof Element ? target : null;
    const trigger = element
      ? element.closest('.lr-lightbox-trigger')
      : null;
    const content = element
      ? element.closest('.imageblock .content')
      : null;

    if (!trigger && !content) {
      clearHint();
      return;
    }

    const sourceFigure = (trigger || content).closest('figure');
    const sourceImage = sourceFigure?.querySelector('.content img');
    const focusTarget = trigger || sourceFigure?.querySelector('.lr-lightbox-trigger');
    if (!sourceImage || !focusTarget) return;

    event.preventDefault();

    if (trigger) {
      clearHint();
      openLightbox(focusTarget, sourceFigure, sourceImage);
      return;
    }

    const touchActivation = event.detail > 0 && (
      ('pointerType' in event && event.pointerType === 'touch') ||
      (!('pointerType' in event) && matchMedia('(pointer: coarse)').matches)
    );

    if (touchActivation && hintFigure !== sourceFigure) {
      clearHint();
      hintFigure = sourceFigure;
      sourceFigure.classList.add('is-hint-visible');
      return;
    }

    clearHint();
    openLightbox(focusTarget, sourceFigure, sourceImage);
  });

  imageButton.addEventListener('click', () => {
    setCaptionVisible(!dialog.classList.contains('is-caption-visible'));
  });

  closeButton.addEventListener('click', () => dialog.close());

  figure.addEventListener('click', (event) => {
    if (event.target === figure) dialog.close();
  });

  dialog.addEventListener('close', () => {
    clearHint();
    returnFocusTarget?.focus({ preventScroll: true });
    returnFocusTarget = null;
  });
})();
