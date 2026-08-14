import nodemailer from 'nodemailer';
import dotenv from 'dotenv';

dotenv.config();

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.GMAIL_USER,
    pass: process.env.GMAIL_APP_PASSWORD,
  },
});

export const sendOtpEmail = async (toEmail, otpCode) => {
  const mailOptions = {
    from: `"Spiritual Platform" <${process.env.GMAIL_USER}>`,
    to: toEmail,
    subject: 'Verify your email — Spiritual Platform',
    html: `
      <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto;">
        <h2 style="color: #4a6b57;">Verify your email</h2>
        <p>Use the code below to verify your account. This code expires in 10 minutes.</p>
        <p style="font-size: 32px; font-weight: bold; letter-spacing: 4px; color: #35503f;">
          ${otpCode}
        </p>
        <p style="color: #6b6b6b; font-size: 0.9rem;">
          If you didn't request this, you can safely ignore this email.
        </p>
      </div>
    `,
  };

  await transporter.sendMail(mailOptions);
};

export const sendPasswordResetEmail = async (toEmail, resetLink) => {
  const mailOptions = {
    from: `"Spiritual Platform" <${process.env.GMAIL_USER}>`,
    to: toEmail,
    subject: 'Reset your password — Spiritual Platform',
    html: `
      <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto;">
        <h2 style="color: #4a6b57;">Reset your password</h2>
        <p>We received a request to reset your password. Click the button below to choose a new one. This link expires in 30 minutes.</p>
        <a href="${resetLink}" style="display: inline-block; background-color: #4a6b57; color: #fff; padding: 12px 24px; border-radius: 6px; text-decoration: none; margin: 16px 0;">
          Reset Password
        </a>
        <p style="color: #6b6b6b; font-size: 0.9rem;">
          If you didn't request this, you can safely ignore this email — your password will remain unchanged.
        </p>
      </div>
    `,
  };

  await transporter.sendMail(mailOptions);
};