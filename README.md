# Welcome to Flow-IPC

This site hosts up-to-date documentation and release info for the **Flow-IPC** project.  The documentation found here is identical to that packaged in **Flow-IPC** and **Flow** release packages and source-control checkouts.

## Where to begin?

The project lives in the `Flow-IPC` [organization at GitHub](https://github.com/Flow-IPC).  You can obtain it either via Git checkout (with submodules enabled) or by grabbing a release package.  To get your bearings as to the nature of the project please see the main repository, named `ipc`.  To wit:

The [README in that repo](https://github.com/Flow-IPC/ipc/blob/main/README.md) is a good place to start.  It might direct you back to this site, if you'd like to read online documentation and/or peruse or obtain a particular version of the product.  Those resources can be found below.  So to summarize:
  - Flow-IPC "base of operations" is the GitHub organization (especially `ipc` repo) linked here.
  - The web site you're reading, at this time, merely hosts online documentation and release links for your convenience.

## Documentation and releases

[//]: # (This is a comment.  A blank line before and after a comment block like this is mandatory.)
[//]: # (--)
[//]: # (The following section is edited by .github/scripts/massage_root_page.pl script.  If editing manually you must)
[//]: # (exercise great caution to remain compatible with that script.  As of this writing you -can- delete Release)
[//]: # (lines, and you can re-order them; and within reason you can edit non-Release lines.  Any other change,)
[//]: # (including changing wording, spacing, etc., of Release lines implies likely change of aforementioned script.)
[//]: # (--)
[//]: # (massage_root_page.pl:Flow-IPC section BEGIN.)

Here is the **Flow-IPC** online documentation for your immediate perusal (plus release links):
  - **Flow-IPC** branch `main` tip: [documentation](./doc/flow-ipc/versions/main/index.html)
  - Release **Flow-IPC v1.0.0**: [documentation](./doc/flow-ipc/versions/v1.0.0/index.html) \| [release info](https://github.com/Flow-IPC/ipc/releases/tag/v1.0.0)

[//]: # (massage_root_page.pl:Flow-IPC section END.)

---

Note: If you have a **Flow-IPC** release package (from above), you *do not need* a **Flow** package (from below): it's already included.  The online Flow *documentation links and release notes* may be of interest, though.

---

[//]: # (massage_root_page.pl:Flow section BEGIN.)

Here is the **Flow** online documentation for your immediate perusal (plus release links):
  - **Flow** branch `main` tip: [documentation](./doc/flow/versions/main/index.html)

[//]: # (massage_root_page.pl:Flow section END.)

---

Or you can locally view the same documentation by pointing your browser at the below-mentioned locations in your checkout or unpacked package.  Or, upon clicking on a CI/CD pipeline run for [Flow-IPC](https://github.com/Flow-IPC/ipc/actions) or [Flow](https://github.com/Flow-IPC/flow/actions), you can download the artifact named `ipc-doc` or `flow-doc`, respectively.  It is a tarball containing the documentation; unpack it and point your browser at the result.

Such documentation is generated directly from the source code automatically and is stored as follows:
  - (for **Flow-IPC**) inside the checked-out repository `ipc` in the `doc/ipc_doc/` directory;
    - (for **Flow**) inside the checked-out (with submodules) repository `ipc`: in the `flow/doc/flow_doc/` directory;
  - (for **Flow**) inside the checked-out repository `flow`: in the `doc/flow_doc/` directory;
  - online at this web site, as linked above.

Both sets of documentation (in-repo and online) are generated/deployed automatically:
  - when the `main` branch of `ipc` or `flow` is updated, thus changing the source code of Flow-IPC or Flow respectively;
  - when the `main` branch of `ipc` or `flow` is tagged to mark a new release (e.g., `v1.2.3`) of Flow-IPC or Flow respectively.
