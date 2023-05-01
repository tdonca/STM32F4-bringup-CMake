# Hello world docker action

Runs unit tests. TODO: cleanup

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

uses: actions/docker-action@v2
with:
  who-to-greet: 'Mona the Octocat'