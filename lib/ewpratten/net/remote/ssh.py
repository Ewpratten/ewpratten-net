from pathlib import Path
import subprocess
from typing import List


def exec_remote_command(cmd: List[str], host: str, user: str) -> int:
    return subprocess.check_call(
        ['ssh', f'{user}@{host}', *cmd])


def exec_script_on_host(script_path: Path, host: str, user: str) -> int:

    # Scp the script to the host
    subprocess.check_call(
        ['scp', script_path, f'{user}@{host}:/tmp/remote_script.sh'])

    # Execute the script on the host
    return exec_remote_command(['/tmp/remote_script.sh'], host, user)
