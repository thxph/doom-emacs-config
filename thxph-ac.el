(use-package! company
  :commands (company-mode global-company-mode company-complete
             company-complete-common company-manual-begin company-grab-line)
  :config
  (setq company-idle-delay .75
        company-tooltip-limit 10
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)
)
