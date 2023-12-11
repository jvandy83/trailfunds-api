from prisma import Prisma

prisma = Prisma()

User = prisma.user
Trail = prisma.trail
Transaction = prisma.transactions
TrailOrg = prisma.trailorg
Notification = prisma.notification
Trailbucks = prisma.trailbucks
