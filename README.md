
## Features

- **Dynamic NFT Evolution**: NFTs evolve based on real-world activities
- **Activity Tracking**: Records steps and meditation minutes
- **Automatic Evolution**: Triggers evolution when milestones are reached
- **Metadata Management**: Flexible metadata storage and updates
- **Stats System**: NFTs have strength and speed attributes that increase with evolution

## Smart Contract Details

### evolution-nft.clar

The main contract handling NFT minting, evolution, and activity tracking.

#### Key Functions:

- `mint`: Creates a new NFT with initial attributes
- `update-activity`: Records user activities (steps and meditation)
- `check-evolution`: Verifies if evolution conditions are met
- `evolve-token`: Upgrades NFT attributes and metadata
- `get-token-data`: Retrieves NFT information
- `get-evolution-progress`: Shows activity progress

### metadata-manager.clar

Handles metadata storage and updates for the NFTs.

#### Key Functions:

- `update-metadata`: Updates NFT metadata URI and attributes
- `get-metadata`: Retrieves current metadata for an NFT

## Evolution Mechanics

NFTs evolve when users complete the following milestones:
- Walk 10,000 steps daily for 7 days (70,000 total steps)
- Complete 10 minutes of meditation daily for 7 days (70 total minutes)

## Setup and Deployment

1. Install Clarinet:
```bash
curl -L https://github.com/hirosystems/clarinet/releases/download/v1.0.0/clarinet-linux-x64-glibc.tar.gz | tar xz
