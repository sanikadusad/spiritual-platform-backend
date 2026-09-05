import express from 'express';
import { createCourse, getCourses, getCourseById, updateCourse } from '../controllers/courseController.js';
import { requireAuth, requireRole } from '../middleware/authMiddleware.js';

const router = express.Router();

router.get('/', getCourses);
router.get('/:id', getCourseById);
router.post('/', requireAuth, requireRole('admin'), createCourse);
router.patch('/:id', requireAuth, requireRole('admin'), updateCourse);

export default router;