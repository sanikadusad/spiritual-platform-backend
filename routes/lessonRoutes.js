import express from 'express';
import { createLesson, getLessonsByCourse, updateLesson, deleteLesson } from '../controllers/lessonController.js';
import { requireAuth, requireRole } from '../middleware/authMiddleware.js';
import { upload } from '../utils/storage.js';

const router = express.Router({ mergeParams: true });

router.get('/', getLessonsByCourse);
router.post('/', requireAuth, requireRole('mentor', 'admin'), upload.single('content'), createLesson);
router.patch('/:lessonId', requireAuth, requireRole('mentor', 'admin'), updateLesson);
router.delete('/:lessonId', requireAuth, requireRole('mentor', 'admin'), deleteLesson);

export default router;