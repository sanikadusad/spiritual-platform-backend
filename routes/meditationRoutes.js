import express from 'express';
import {
  getCategories,
  createCategory,
  uploadMeditation,
  getMeditations,
  getMeditationById,
} from '../controllers/meditationController.js';
import { requireAuth, requireRole } from '../middleware/authMiddleware.js';
import { upload } from '../utils/storage.js';

const router = express.Router();

router.get('/categories', getCategories);
router.post('/categories', requireAuth, requireRole('mentor', 'admin'), createCategory);

router.get('/', getMeditations);
router.get('/:id', getMeditationById);
router.post('/', requireAuth, requireRole('mentor', 'admin'), upload.single('media'), uploadMeditation);

export default router;