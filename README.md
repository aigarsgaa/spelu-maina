# Spēļu Maina - Board Game Marketplace

A modern marketplace for board game enthusiasts to swap, sell, and give away used board games. This platform integrates with BoardGameGeek's API to provide accurate game information and make listing games a breeze.

## Features

- **User Authentication**: Sign up, log in, and manage your profile
- **Game Database**: Search and add games from BoardGameGeek's extensive database
- **Listings**: Create listings for games you want to trade, sell, or give away
- **Search & Discovery**: Find games near you with advanced filtering options
- **Messaging**: Communicate with other users securely within the platform
- **Ratings & Reviews**: Build trust within the community with user ratings

## Tech Stack

### Frontend
- Next.js 13+ with App Router
- TypeScript
- Tailwind CSS for styling
- React Query for data fetching
- NextAuth.js for authentication

### Backend
- NestJS
- PostgreSQL with Prisma ORM
- Redis for caching
- JWT for authentication
- Docker & Docker Compose for containerization

## Getting Started

### Prerequisites

- Node.js 18+
- Docker & Docker Compose
- npm or yarn

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/aigarsgaa/spelu-maina.git
   cd spelu-maina
   ```

2. **Set up the backend**
   ```bash
   cd apps/backend
   cp .env.example .env  # Update the environment variables as needed
   docker-compose up -d  # Start PostgreSQL and Redis
   npm install
   npm run start:dev
   ```

3. **Set up the frontend**
   ```bash
   cd ../frontend
   cp .env.example .env  # Update the environment variables as needed
   npm install
   npm run dev
   ```

4. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:3001
   - PostgreSQL: localhost:5432
   - Redis: localhost:6379

## Project Structure

```
spelu-maina/
├── apps/
│   ├── frontend/          # Next.js frontend application
│   └── backend/           # NestJS backend application
├── packages/              # Shared packages (if any)
│   └── common/           # Shared code between frontend and backend
├── .github/               # GitHub workflows and templates
├── .husky/                # Git hooks
├── .vscode/               # VS Code settings
├── .eslintrc.js           # ESLint configuration
├── .prettierrc            # Prettier configuration
├── package.json           # Root package.json (workspace configuration)
└── README.md              # This file
```

## Environment Variables

### Backend

Create a `.env` file in the `apps/backend` directory with the following variables:

```env
# Database
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=boardgame_marketplace
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/boardgame_marketplace

# Redis
REDIS_URL=redis://localhost:6379

# App
PORT=3000
NODE_ENV=development

# JWT
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRES_IN=1d

# BoardGameGeek API
BGG_API_URL=https://boardgamegeek.com/xmlapi2

# CORS
FRONTEND_URL=http://localhost:3000
```

### Frontend

Create a `.env.local` file in the `apps/frontend` directory with the following variables:

```env
NEXT_PUBLIC_API_URL=http://localhost:3001
NEXT_PUBLIC_APP_ENV=development
```

## Development Workflow

1. **Coding Standards**
   - Follow the existing code style (ESLint + Prettier)
   - Write meaningful commit messages
   - Keep PRs focused and small

2. **Git Hooks**
   - Pre-commit: Runs Prettier and ESLint on staged files
   - Pre-push: Runs tests

3. **Branch Naming**
   - `feature/`: New features
   - `bugfix/`: Bug fixes
   - `hotfix/`: Critical production fixes
   - `chore/`: Maintenance tasks

## Deployment

### Staging

Merging to the `staging` branch will trigger a deployment to the staging environment.

### Production

Merging to the `main` branch will trigger a production deployment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [BoardGameGeek](https://boardgamegeek.com/) for their comprehensive board game database
- [Next.js](https://nextjs.org/) and [NestJS](https://nestjs.com/) documentation
- The board gaming community for inspiration and feedback
