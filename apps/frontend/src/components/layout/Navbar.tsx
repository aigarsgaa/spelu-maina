'use client';

import React from 'react';
import { FaSun, FaMoon, FaBars } from 'react-icons/fa';
import Link from 'next/link';

const NavLink = ({ children, href }: { children: React.ReactNode, href: string }) => (
  <Link 
    href={href} 
    className="px-2 py-1 rounded-md hover:bg-gray-100 transition-colors duration-200"
  >
    {children}
  </Link>
);

export default function Navbar() {
  const isDark = false; // Will implement color mode toggle later
  
  return (
    <nav className="bg-white border-b border-gray-200 sticky top-0 z-10">
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex h-16 items-center justify-between">
          <div className="flex items-center">
            <Link href="/" className="mr-8">
              <h2 className="text-lg font-medium cursor-pointer">
                Spēļu Maina
              </h2>
            </Link>

            <div className="hidden md:flex gap-4">
              <NavLink href="/games">Games</NavLink>
              <NavLink href="/listings">Listings</NavLink>
              <NavLink href="/about">About</NavLink>
            </div>
          </div>

          <div className="flex items-center gap-4">
            <button
              aria-label="Toggle color mode"
              onClick={() => {}}
              className="p-2 rounded-full hover:bg-gray-100 transition-colors duration-200"
            >
              {isDark ? <FaSun /> : <FaMoon />}
            </button>
            <div className="hidden md:block">
              <Link 
                href="/login"
                className="inline-block px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50 mr-2"
              >
                Sign In
              </Link>
              <Link 
                href="/register"
                className="inline-block px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700"
              >
                Sign Up
              </Link>
            </div>
            <div className="md:hidden">
              <button
                aria-label="Open menu"
                onClick={() => {}}
                className="p-2 rounded-md hover:bg-gray-100 transition-colors duration-200"
              >
                <FaBars />
              </button>
            </div>
          </div>
        </div>
      </div>
    </nav>
  );
}
