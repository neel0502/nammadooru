// ============================================================
// NammaDooru — Photo Upload to Supabase Storage
// ============================================================

import imageCompression from 'browser-image-compression';
import { supabase } from './supabase';

const BUCKET_NAME = 'report-photos';

/**
 * Compress and upload a photo to Supabase Storage.
 * Returns the public URL of the uploaded image.
 */
export async function uploadReportPhoto(file: File): Promise<string> {
  // Compress the image
  const compressed = await imageCompression(file, {
    maxWidthOrHeight: 1200,
    maxSizeMB: 1,
    useWebWorker: true,
    fileType: 'image/jpeg',
    initialQuality: 0.8,
  });

  // Generate a unique filename
  const timestamp = Date.now();
  const random = Math.random().toString(36).substring(2, 8);
  const fileName = `report_${timestamp}_${random}.jpg`;

  // Upload to Supabase Storage
  const { error } = await supabase.storage
    .from(BUCKET_NAME)
    .upload(fileName, compressed, {
      contentType: 'image/jpeg',
      cacheControl: '31536000',
      upsert: false,
    });

  if (error) {
    throw new Error(`Photo upload failed: ${error.message}`);
  }

  // Get public URL
  const { data: urlData } = supabase.storage
    .from(BUCKET_NAME)
    .getPublicUrl(fileName);

  return urlData.publicUrl;
}
