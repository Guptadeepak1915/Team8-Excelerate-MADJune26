# Week 3 Changelog

## Data Source

- Program Listing now loads program data from `assets/data/programs.json`.
- Program Details receives the selected JSON-backed program and displays its
  description, schedule information, seat count, and learning outcomes.

## Form Added

- Added a Program Registration form from the Program Details screen.
- The form collects full name, email address, password, and a short motivation
  response.
- Validation requires a non-empty name, valid-looking email, password with at
  least 6 characters, and a motivation response with at least 10 characters.
- On successful submission, the app shows a success message and marks the
  program as registered.

## Loading And Error Handling

- Program Listing shows a loading spinner while reading the JSON file.
- Program Listing includes an empty state if the data source returns no items.
- Program Listing includes an error state with a retry action if JSON loading
  fails.
- Registration submission shows a temporary submitting state before completion.

## Suggested Commit Messages

- `Connected program listing to JSON data`
- `Added program registration form with validation`
- `Updated README and Week 3 changelog`
