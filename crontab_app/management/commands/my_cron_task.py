from django.core.management.base import BaseCommand
from django.utils import timezone


class Command(BaseCommand):
    help = "Run a custom cron task"

    def handle(self, *args, **kwargs):
        # Define your custom task here
        self.stdout.write(f"Cron job running at {timezone.now()}")
        self.stdout.write(f"This is a breakthrough!")
        # You can call any custom logic, like sending emails, cleaning up old data, etc.
