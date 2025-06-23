# Decentralized Human Resources Performance Management

A blockchain-based HR performance management system built with Clarity smart contracts on the Stacks blockchain. This system provides a transparent, immutable, and decentralized approach to managing employee performance, goals, reviews, feedback, and development planning.

## Features

### 🔐 Performance Manager Verification
- Validates and manages performance managers
- Role-based access control
- Manager certification tracking

### 🎯 Goal Setting
- Create and manage employee performance goals
- Track goal progress and completion
- Status management (Draft, Active, Completed, Cancelled)

### 📋 Review Coordination
- Schedule and coordinate performance reviews
- Track review periods and completion status
- Manager-employee review workflow

### 💬 Feedback Collection
- Collect multi-source feedback (Peer, Manager, Self)
- Rating system (1-5 scale)
- Structured feedback with comments

### 📈 Development Planning
- Create employee development plans
- Skill area tracking
- Priority-based planning (Low, Medium, High)

## Smart Contracts

### 1. Performance Manager (`performance-manager.clar`)
Manages the verification and authorization of performance managers within the system.

**Key Functions:**
- `add-performance-manager` - Add a new performance manager
- `remove-performance-manager` - Remove a performance manager
- `is-performance-manager` - Check if a user is a performance manager
- `get-manager-details` - Get manager information

### 2. Goal Setting (`goal-setting.clar`)
Handles the creation and management of employee performance goals.

**Key Functions:**
- `create-goal` - Create a new performance goal
- `update-goal-status` - Update goal status
- `activate-goal` - Activate a draft goal
- `complete-goal` - Mark a goal as completed

### 3. Review Coordination (`review-coordination.clar`)
Coordinates performance reviews between managers and employees.

**Key Functions:**
- `schedule-review` - Schedule a performance review
- `start-review` - Begin a scheduled review
- `complete-review` - Complete a review
- `get-review` - Get review details

### 4. Feedback Collection (`feedback-collection.clar`)
Collects and manages performance feedback from various sources.

**Key Functions:**
- `submit-feedback` - Submit performance feedback
- `update-feedback` - Update existing feedback
- `get-feedback` - Retrieve feedback details

### 5. Development Planning (`development-planning.clar`)
Plans and tracks employee development activities.

**Key Functions:**
- `create-development-plan` - Create a development plan
- `activate-plan` - Activate a development plan
- `complete-plan` - Complete a development plan
- `get-development-plan` - Get plan details

## Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd hr-performance-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## Usage

### Deploying Contracts

Deploy the contracts to the Stacks blockchain using Clarinet:

\`\`\`bash
clarinet deploy
\`\`\`

### Interacting with Contracts

#### Adding a Performance Manager
\`\`\`clarity
(contract-call? .performance-manager add-performance-manager 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG "John Doe" "Engineering")
\`\`\`

#### Creating a Goal
\`\`\`clarity
(contract-call? .goal-setting create-goal 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG "Complete Project Alpha" "Finish the alpha version" u2000)
\`\`\`

#### Scheduling a Review
\`\`\`clarity
(contract-call? .review-coordination schedule-review 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG u1000 u2000 u2100)
\`\`\`

#### Submitting Feedback
\`\`\`clarity
(contract-call? .feedback-collection submit-feedback 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG u1 u4 "Great performance" u1000)
\`\`\`

#### Creating a Development Plan
\`\`\`clarity
(contract-call? .development-planning create-development-plan 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG "Leadership" "Develop leadership skills" u3000 u2)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test files are located in the `tests/` directory and cover:
- Performance manager verification
- Goal setting and management
- Review coordination
- Feedback collection
- Development planning

## Data Structures

### Goal Structure
\`\`\`clarity
{
employee: principal,
manager: principal,
title: (string-ascii 100),
description: (string-ascii 500),
target-date: uint,
status: uint,
created-at: uint
}
\`\`\`

### Review Structure
\`\`\`clarity
{
employee: principal,
manager: principal,
period-start: uint,
period-end: uint,
status: uint,
scheduled-date: uint,
created-at: uint
}
\`\`\`

### Feedback Structure
\`\`\`clarity
{
employee: principal,
reviewer: principal,
feedback-type: uint,
rating: uint,
comments: (string-ascii 1000),
review-period: uint,
submitted-at: uint
}
\`\`\`

## Status Constants

### Goal Status
- `STATUS_DRAFT` (0) - Goal is in draft state
- `STATUS_ACTIVE` (1) - Goal is active
- `STATUS_COMPLETED` (2) - Goal is completed
- `STATUS_CANCELLED` (3) - Goal is cancelled

### Review Status
- `REVIEW_PENDING` (0) - Review is scheduled but not started
- `REVIEW_IN_PROGRESS` (1) - Review is in progress
- `REVIEW_COMPLETED` (2) - Review is completed

### Feedback Types
- `FEEDBACK_PEER` (0) - Peer feedback
- `FEEDBACK_MANAGER` (1) - Manager feedback
- `FEEDBACK_SELF` (2) - Self assessment

### Priority Levels
- `PRIORITY_LOW` (1) - Low priority
- `PRIORITY_MEDIUM` (2) - Medium priority
- `PRIORITY_HIGH` (3) - High priority

## Error Codes

Each contract defines specific error codes for different failure scenarios:

- **Performance Manager**: 100-199
- **Goal Setting**: 200-299
- **Review Coordination**: 300-399
- **Feedback Collection**: 400-499
- **Development Planning**: 500-599

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run the test suite
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Security Considerations

- All contracts implement proper access control
- Input validation is performed on all public functions
- Error handling prevents unauthorized access
- Data integrity is maintained through blockchain immutability

## Future Enhancements

- Integration with external HR systems
- Advanced analytics and reporting
- Multi-signature approvals for sensitive operations
- Integration with payroll systems
- Mobile application interface
  \`\`\`
  \`\`\`

Finally, let's create the PR details file:
