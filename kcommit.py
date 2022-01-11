import typer
import os

app = typer.Typer()


def main(
    message: str,
    time: str = typer.Option(
        "", "--time", "-t", help="Time of the commit (e.g.: 14:00:01)"
    ),
    day: str = typer.Option("", "--day", "-d", help="Day of the commit"),
):
    command = f"git commit -m {message}"
    if day:
        command = f"COMMIT_DATE={day}; {command}"
    dry_run = True
    if dry_run:
        typer.echo(command)
    else:
        ...


if __name__ == "__main__":
    typer.run(main)
foo
