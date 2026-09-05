import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRoutes from './routes/authRoutes.js';
import meditationRoutes from './routes/meditationRoutes.js';
import userRoutes from './routes/userRoutes.js';
import courseRoutes from './routes/courseRoutes.js';
dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.use('/api/users', userRoutes);
app.use('/api/courses', courseRoutes);

app.get('/', (req, res) => {
  res.send('Spiritual Platform API is running.');
});

app.use('/api/auth', authRoutes);
app.use('/api/meditation', meditationRoutes);
app.use('/uploads', express.static('uploads'));

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

