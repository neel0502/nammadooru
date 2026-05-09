import { useEffect, useRef, useCallback, type ReactNode } from 'react';

interface Props {
  isOpen: boolean;
  onClose: () => void;
  title?: string;
  children: ReactNode;
}

export function BottomSheet({ isOpen, onClose, title, children }: Props) {
  const sheetRef = useRef<HTMLDivElement>(null);
  const contentRef = useRef<HTMLDivElement>(null);
  const startY = useRef(0);
  const currentY = useRef(0);
  const isDragging = useRef(false);

  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = '';
    }
    return () => { document.body.style.overflow = ''; };
  }, [isOpen]);

  const handleTouchStart = useCallback((e: React.TouchEvent) => {
    // Only allow drag-to-dismiss from the handle area or when scrolled to top
    const contentEl = contentRef.current;
    const isAtTop = !contentEl || contentEl.scrollTop <= 0;
    const target = e.target as HTMLElement;
    const isHandle = target.closest('.bottom-sheet__handle') !== null;

    if (isHandle || isAtTop) {
      startY.current = e.touches[0].clientY;
      isDragging.current = true;
    }
  }, []);

  const handleTouchMove = useCallback((e: React.TouchEvent) => {
    if (!isDragging.current) return;
    currentY.current = e.touches[0].clientY;
    const diff = currentY.current - startY.current;
    if (diff > 0 && sheetRef.current) {
      // Prevent the content scroll while dragging down
      e.preventDefault();
      sheetRef.current.style.transform = `translateY(${diff}px)`;
      sheetRef.current.style.transition = 'none';
    }
  }, []);

  const handleTouchEnd = useCallback(() => {
    if (!isDragging.current) return;
    const diff = currentY.current - startY.current;
    if (diff > 80) {
      // Swipe down — dismiss
      if (sheetRef.current) {
        sheetRef.current.style.transition = 'transform 0.2s ease';
        sheetRef.current.style.transform = 'translateY(100%)';
      }
      setTimeout(onClose, 200);
    } else {
      // Snap back
      if (sheetRef.current) {
        sheetRef.current.style.transition = 'transform 0.2s ease';
        sheetRef.current.style.transform = '';
      }
    }
    isDragging.current = false;
    startY.current = 0;
    currentY.current = 0;
  }, [onClose]);

  if (!isOpen) return null;

  return (
    <div className="bottom-sheet-overlay" onClick={onClose}>
      <div
        ref={sheetRef}
        className={`bottom-sheet ${isOpen ? 'bottom-sheet--open' : ''}`}
        onClick={(e) => e.stopPropagation()}
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
      >
        <div className="bottom-sheet__handle" />
        {title && <h2 className="bottom-sheet__title">{title}</h2>}
        <div ref={contentRef} className="bottom-sheet__content">
          {children}
        </div>
      </div>
    </div>
  );
}
