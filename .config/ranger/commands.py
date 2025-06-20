from ranger.api.commands import Command
import os

class terminal(Command):
    """
    :terminal

    Abre una terminal externa en el directorio actual.
    """
    def execute(self):
        import os
        term = os.getenv('TERMINAL') or 'kitty'
        path = self.fm.thisdir.path
        self.fm.run(f"{term} --directory='{path}'", flags='f')


class code(Command):
    """
    :code

    Abre el archivo seleccionado en VS Code.
    """
    def execute(self):
        if self.fm.thisfile.is_file:
            self.fm.run(f"code '{self.fm.thisfile.path}'", flags='f')

class vim(Command):
    """
    :vim

    Abre el archivo seleccionado en Neovim (en una terminal nueva).
    """
    def execute(self):
        if self.fm.thisfile.is_file:
            term = os.getenv('TERMINAL') or 'kitty'
            file_path = self.fm.thisfile.path
            self.fm.run(f"{term} -e nvim '{file_path}'", flags='f')