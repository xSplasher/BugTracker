# Generated by Django 3.2 on 2021-05-29 14:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0009_alter_issues_options'),
    ]

    operations = [
        migrations.CreateModel(
            name='Projects',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='BRO', max_length=200)),
            ],
        ),
        migrations.DeleteModel(
            name='Choice',
        ),
    ]
