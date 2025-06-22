import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Navbar from '@/components/layout/Navbar';

// Initialize Inter font
const inter = Inter({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "Spēļu Maina - Board Game Marketplace",
  description: "A marketplace for swapping, selling, and giving away used board games",
  themeColor: "#0077e6",
  icons: {
    icon: '/favicon.ico',
  },
};

export const viewport = {
  width: 'device-width',
  initialScale: 1,
  maximumScale: 1,
  userScalable: false,
  viewportFit: 'cover',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <link rel="icon" href="/favicon.ico" sizes="any" />
      </head>
      <body className={`${inter.variable} font-sans antialiased`}>
        <div className="min-h-screen flex flex-col">
          <Navbar />
          <main className="flex-1 py-8">
            <div className="container mx-auto px-4 max-w-7xl">
              {children}
            </div>
          </main>
          <footer className="py-4 border-t border-gray-200 bg-white dark:bg-gray-800">
            <div className="container mx-auto px-4 max-w-7xl text-center">
              © {new Date().getFullYear()} Spēļu Maina. All rights reserved.
            </div>
          </footer>
        </div>
      </body>
    </html>
  );
}
